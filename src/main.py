from fastapi import FastAPI

app = FastAPI(title="Grid ESP Service", version="0.1.0")

@app.get("/")
async def root():
    return {"status": "ok", "service": "grid_esp"}

@app.get("/health")
async def health():
    return {"status": "healthy"}

@app.get("/grid/status")
async def grid_status():
    # Сюда потом вставишь логику для грид-бота / ESP
    return {"grid_enabled": False, "levels": [], "active_orders": 0}
